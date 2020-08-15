package com.kaiv.model;

import java.awt.*;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;

public class PrintObject implements Printable {

    public PrintObject(int id, String name, int price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    static int id;
    static String name;
    static int price;

    @Override
    public int print(Graphics graphics, PageFormat pageFormat, int page) throws PrinterException {
        if (page > 0) { /* We have only one page, and 'page' is zero-based */
            return NO_SUCH_PAGE;
        }

        /* User (0,0) is typically outside the imageable area, so we must
         * translate by the X and Y values in the PageFormat to avoid clipping
         */
        Graphics2D g2d = (Graphics2D) graphics;
        g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());

        /* Now we perform our rendering */
        graphics.drawString("Товарний чек для товару:",5, 10);
        graphics.drawString("ID: " + id, 5, 25);
        graphics.drawString("Назва товару: " + name, 5, 40);
        graphics.drawString("Ціна товару: " + price, 5, 55);

        /* tell the caller that this page is part of the printed document */
        return PAGE_EXISTS;
    }
}