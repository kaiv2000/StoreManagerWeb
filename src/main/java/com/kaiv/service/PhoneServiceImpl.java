package com.kaiv.service;

import com.kaiv.dao.PhoneDao;
import com.kaiv.model.Cellphone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.print.*;
import java.awt.print.*;
import java.io.*;
import java.net.Socket;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service("phoneService")
public class PhoneServiceImpl implements PhoneService {

    PhoneDao phoneDao;

    @Autowired
    public void setPhoneDao(PhoneDao phoneDao) {
        this.phoneDao = phoneDao;
    }

    @Override
    public Cellphone findById(Integer id) {
        return phoneDao.findById(id);
    }

    @Override
    public List<Cellphone> findActivePhones() {
        return phoneDao.findActivePhones();
    }

    @Override
    public List<Cellphone> findSoldPhones() {
        return phoneDao.findSoldPhones();
    }

    @Override
    public List<Cellphone> findInDebtPhones() {
        return phoneDao.findInDebtPhones();
    }

    @Override
    public List<Cellphone> findSearchGoods(String searchWord) {
        return phoneDao.findSearchGoods(searchWord);
    }

    @Override
    public void saveOrUpdate(Cellphone cellphone) {

        if (cellphone.getId() == null) {
            phoneDao.save(cellphone);
        } else {
            phoneDao.update(cellphone);
        }
    }

    @Override
    public void delete(int id) {
        phoneDao.delete(id);
    }

   /* public static void main(String[] args) throws IOException, PrintException, InterruptedException {

        PrintService[] printerList = PrinterJob.lookupPrintServices();

        PrintService selectedPrinter = null;
        for (PrintService onePrinter : printerList) {
            if (onePrinter.getName().contains("Universal Document Converter")) {
                selectedPrinter = onePrinter;
                break;
            }
        }

        for (PrintService onePrinter : printerList) {
            System.out.println(onePrinter.getName());
        }


        FileInputStream fileToPrint = new FileInputStream("D:/1.txt");
        Doc docForPrinting = new SimpleDoc(fileToPrint, DocFlavor.INPUT_STREAM.AUTOSENSE, null);

        DocPrintJob printJob = selectedPrinter.createPrintJob();
        printJob.print(docForPrinting, new HashPrintRequestAttributeSet());
        fileToPrint.close();
    }*/


    public List<String> print(int id, String name, int price, String clientIp) {

        try {

            Socket socket = new Socket(clientIp, 5000);
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            String advice = reader.readLine();
            System.out.println("You have to do today: " + advice);
            reader.close();

        } catch (IOException e) {
            e.printStackTrace();
        }


        PrintService[] printerList = PrinterJob.lookupPrintServices();

        List<String> list = new ArrayList<>();

        for (PrintService onePrinter : printerList) {
            list.add(onePrinter.getName());
        }

        return list;

      /*  PrinterJob printerJob = PrinterJob.getPrinterJob();

        if (printerJob.printDialog()) {
            try {
                printerJob.print();
            } catch (PrinterException exc) {
                System.out.println(exc);
            }
        }*/

    }
}