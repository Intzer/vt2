package com.bsuir.kokarev.phoneshop.web.commands;

import com.bsuir.kokarev.phoneshop.web.exceptions.CommandException;
import jakarta.servlet.http.HttpServletRequest;

/**
 * @author nekit
 * @version 1.0
 * Interface of all commands
 */
public interface ICommand {
    /**
     * Main function of all commands
     *
     * @param request http request
     * @return jsp path
     * @throws CommandException throws when some errors during execution of command
     */
    String execute(HttpServletRequest request) throws CommandException;
}
