package com.bsuir.kokarev.phoneshop.web.commands.commandImpl;

import com.bsuir.kokarev.phoneshop.model.dao.OrderDao;
import com.bsuir.kokarev.phoneshop.model.dao.impl.JdbcOrderDao;
import com.bsuir.kokarev.phoneshop.model.exceptions.DaoException;
import com.bsuir.kokarev.phoneshop.web.JspPageName;
import com.bsuir.kokarev.phoneshop.web.commands.ICommand;
import com.bsuir.kokarev.phoneshop.web.exceptions.CommandException;
import jakarta.servlet.http.HttpServletRequest;

/**
 * @author nekit
 * @version 1.0
 * Command for admin orders page
 */
public class AdminOrdersCommand implements ICommand {
    private static final String ORDERS_ATTRIBUTE = "orders";
    private final OrderDao orderDao = JdbcOrderDao.getInstance();

    /**
     * @param request http request
     * @return Return armin order page jsp path
     * @throws CommandException throws when there is some errors during command execution
     */
    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        try {
            request.setAttribute(ORDERS_ATTRIBUTE, orderDao.findOrders());
        } catch (DaoException e) {
            throw new CommandException(e.getMessage());
        }
        return JspPageName.ADMIN_ORDERS_PAGE_JSP;
    }
}
