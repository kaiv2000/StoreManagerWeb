package com.kaiv.web;

import com.kaiv.model.*;
import com.kaiv.service.*;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.PersistenceException;
import javax.persistence.PrePersist;
import javax.servlet.http.HttpServletRequest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.kaiv.web.UserController.getPrincipal;


@Controller
public class GoodsController {

    static String Tyachiv = "м.Тячів";
    static String Rakhiv = "м.Рахів";
    static String Irshava = "м.Іршава";

    static String typeCellPhones = "CellPhones";
    static String typeAccessories = "Accessories";
    static String typeSpareparts = "Spareparts";

    @Autowired
    private PhoneService phoneService;

    @Autowired
    private AccessoriesService accessoriesService;

    @Autowired
    SparepartService sparepartService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    ReportGoodsService reportService;

    @Autowired
    private WebService webService;

    @Autowired
    public void setPhoneService(PhoneService phoneService) {
        this.phoneService = phoneService;
    }

    @Autowired
    public void setAccessoriesService(AccessoriesService accessoriesService) {
        this.accessoriesService = accessoriesService;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Autowired
    public void setSparepartService(SparepartService sparepartService) {
        this.sparepartService = sparepartService;
    }

    // main page
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String homePage() {
        return "redirect:/main";
    }

    // error page
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String showErrorPage(Model model) {
        return "/error";
    }

    // main page
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String showMainPage(Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        return "goods/mainPage";
    }

    // list Searched Goods
    @RequestMapping(value = "/searchGoods", method = RequestMethod.GET)
    public String showSearchedGoods(@RequestParam(value = "searchString", required = false) String searchString,
                                    Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        if (searchString != null) {

            List<Cellphone> cellphoneList = phoneService.findSearchGoods(searchString);
            List<Accessories> accessoriesList = accessoriesService.findSearchGoods(searchString);
            List<Spareparts> sparepartsList = sparepartService.findSearchParts(searchString);

            List<Object> allGoodsList = new ArrayList<>();
            allGoodsList.addAll(cellphoneList);
            allGoodsList.addAll(accessoriesList);
            allGoodsList.addAll(sparepartsList);

            model.addAttribute("goods", allGoodsList);
        }
        return "goods/goodsList";
    }

    // list active Goods
    @RequestMapping(value = "/active", method = RequestMethod.GET)
    public String showActiveCellPhones(@RequestParam(value = "productType", required = false) String productType,
                                       Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        switch (productType) {

            case "CellPhones":
                model.addAttribute("goods", phoneService.findActivePhones());
                break;
            case "Accessories":
                model.addAttribute("goods", accessoriesService.findActiveAccessories());
                break;
            case "Parts":
                model.addAttribute("goods", sparepartService.findActiveParts());
                break;

            case "CellPhonesTyachiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeCellPhones, Tyachiv, false));
                break;
            case "CellPhonesRakhiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeCellPhones, Rakhiv, false));
                break;
            case "CellPhonesIrshava":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeCellPhones, Irshava, false));
                break;

            case "AccessoriesTyachiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeAccessories, Tyachiv, false));
                break;
            case "AccessoriesRakhiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeAccessories, Rakhiv, false));
                break;
            case "AccessoriesIrshava":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeAccessories, Irshava, false));
                break;

            case "PartsTyachiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeSpareparts, Tyachiv, false));
                break;
            case "PartsRakhiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeSpareparts, Rakhiv, false));
                break;
            case "PartsIrshava":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeSpareparts, Irshava, false));
                break;
        }

        return "goods/goodsList";
    }

    // list sold Goods
    @RequestMapping(value = "/sold", method = RequestMethod.GET)
    public String showSoldCellPhones(@RequestParam(value = "productType", required = false) String productType,
                                     Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        switch (productType) {

            case "inDebtPhones":
                model.addAttribute("goods", phoneService.findInDebtPhones());
                break;

            case "CellPhones":
                model.addAttribute("goods", phoneService.findSoldPhones());
                break;
            case "Accessories":
                model.addAttribute("goods", accessoriesService.findSoldAccessories());
                break;
            case "Parts":
                model.addAttribute("goods", sparepartService.findSoldParts());
                break;

            case "CellPhonesTyachiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeCellPhones, Tyachiv, true));
                break;
            case "CellPhonesRakhiv":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeCellPhones, Rakhiv, true));
                break;
            case "CellPhonesIrshava":
                model.addAttribute("goods", goodsService.findPhonesOneSellPoint(typeCellPhones, Irshava, true));
                break;

            case "AccessoriesTyachiv":
                model.addAttribute("goods", goodsService.findSoldGoodsOneSellPoint(typeAccessories, Tyachiv, true));
                break;
            case "AccessoriesRakhiv":
                model.addAttribute("goods", goodsService.findSoldGoodsOneSellPoint(typeAccessories, Rakhiv, true));
                break;
            case "AccessoriesIrshava":
                model.addAttribute("goods", goodsService.findSoldGoodsOneSellPoint(typeAccessories, Irshava, true));
                break;

            case "PartsTyachiv":
                model.addAttribute("goods", goodsService.findSoldGoodsOneSellPoint(typeSpareparts, Tyachiv, true));
                break;
            case "PartsRakhiv":
                model.addAttribute("goods", goodsService.findSoldGoodsOneSellPoint(typeSpareparts, Rakhiv, true));
                break;
            case "PartsIrshava":
                model.addAttribute("goods", goodsService.findSoldGoodsOneSellPoint(typeSpareparts, Irshava, true));
                break;
        }

        return "goods/goodsList";
    }

    // show product
    @RequestMapping(value = "/goods/{id}", method = RequestMethod.GET)
    public String showProduct(@RequestParam(value = "productType", required = false) String productType,
                              @PathVariable("id") int id,
                              Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("usdRate", getCurrentUsdRate());

        switch (productType) {

            case "CellPhones":

                Cellphone cellphone = phoneService.findById(id);
                if (cellphone == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }

                model.addAttribute("goods", cellphone);
                return "phones/phoneShow";

            case "Accessories":

                Accessories accessories = accessoriesService.findById(id);
                if (accessories == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goods", accessories);
                return "accessories/accessoryShow";

            case "Parts":

                Spareparts spareparts = sparepartService.findById(id);
                if (spareparts == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goods", spareparts);
                return "spareparts/sparepartShow";

        }

        return "goods/goodsList";
    }

    // show Edit product form
    @RequestMapping(value = "/update-goods-{id}", method = RequestMethod.GET)
    public String showUpdateProductForm(@PathVariable("id") int id,
                                        @RequestParam(value = "productType", required = false) String productType,
                                        Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        switch (productType) {

            case "CellPhones":

                Cellphone cellphone = phoneService.findById(id);
                if (cellphone == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }

                model.addAttribute("goodsForm", cellphone);
                return "phones/phoneEdit";

            case "Accessories":

                Accessories accessories = accessoriesService.findById(id);
                if (accessories == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goodsForm", accessories);
                return "accessories/accessoryEdit";

            case "Parts":

                Spareparts spareparts = sparepartService.findById(id);
                if (spareparts == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goodsForm", spareparts);
                return "spareparts/sparepartEdit";
        }
        return "goods/goodsList";
    }

    @ModelAttribute("availableCellPoints")
    public Map<String, String> getCellPointList() {
        Map<String, String> countryList = new HashMap<>();
        countryList.put(Tyachiv, Tyachiv);
        countryList.put(Rakhiv, Rakhiv);
        countryList.put(Irshava, Irshava);
        return countryList;
    }

    @ModelAttribute("availableWarranty")
    public Map<String, String> getWarrantyList() {
        Map<String, String> warrantyList = new LinkedHashMap<>();
        warrantyList.put("1 місяць", "1 місяць");
        warrantyList.put("2 місяці", "2 місяці");
        warrantyList.put("3 місяці", "3 місяці");
        warrantyList.put("4 місяці", "4 місяці");
        warrantyList.put("5 місяців", "5 місяців");
        warrantyList.put("6 місяців", "6 місяців");
        warrantyList.put("7 місяців", "7 місяців");
        warrantyList.put("8 місяців", "8 місяців");
        warrantyList.put("9 місяців", "9 місяців");
        warrantyList.put("10 місяців", "10 місяців");
        warrantyList.put("11 місяців", "11 місяців");
        warrantyList.put("12 місяців", "12 місяців");
        return warrantyList;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("dd-MM-yyyy HH:mm"), true));
    }

    // save or update Phone
    @RequestMapping(value = "/savePhone", method = RequestMethod.POST)
    public String saveOrUpdatePhone(
            @ModelAttribute("goodsForm")
            @Validated Cellphone cellphone,
            BindingResult bindingResult,
            Model model,
            final RedirectAttributes redirectAttributes) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        if (bindingResult.hasErrors()) {
            return "phones/phoneEdit";
        } else {

            try {

                redirectAttributes.addFlashAttribute("css", "success");
                if (cellphone.isNew()) {
                    redirectAttributes.addFlashAttribute("msg", "Товар успішно записаний в базу даних.");
                } else {
                    redirectAttributes.addFlashAttribute("msg", "Товар успішно оновлено в базі даних.");
                }
                cellphone.setPriceOutHryvnya(getPriceInHryvnya(cellphone.getPriceOut()));
                phoneService.saveOrUpdate(cellphone);

            } catch (PersistenceException e) {
                if (e.getCause().toString().contains("ConstraintViolationException")) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Такий IMEI уже є в базі даних!");
                    bindingResult.rejectValue("imei", "non.unique.imei");
                    return "phones/phoneEdit";
                } else {
                    redirectAttributes.addFlashAttribute("css", "danger");
                    redirectAttributes.addFlashAttribute("msg", "Проблема запису в базу даних.");
                    return "phones/phoneEdit";
                }
            }

            return "redirect:/goods/" + cellphone.getId() + "?productType=CellPhones";
        }
    }

    // save or update Accessory
    @RequestMapping(value = "/saveAccessory", method = RequestMethod.POST)
    public String saveOrUpdateAccessory(
            @ModelAttribute("goodsForm")
            @Validated Accessories accessories,
            BindingResult bindingResult,
            Model model,
            final RedirectAttributes redirectAttributes) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        if (bindingResult.hasErrors()) {
            return "accessories/accessoryEdit";
        } else {

            redirectAttributes.addFlashAttribute("css", "success");
            if (accessories.isNew()) {
                redirectAttributes.addFlashAttribute("msg", "Товар успішно записаний в базу даних.");
            } else {
                redirectAttributes.addFlashAttribute("msg", "Товар успішно оновлено в базі даних.");
            }

            accessories.setPriceOutHryvnya(getPriceInHryvnya(accessories.getPriceOut()) / accessories.getStartQuantity());
            accessoriesService.saveOrUpdate(accessories);

            return "redirect:/goods/" + accessories.getId() + "?productType=Accessories";
        }
    }

    // save or update SpareParts
    @RequestMapping(value = "/saveSparePart", method = RequestMethod.POST)
    public String saveOrUpdateSparePart(
            @ModelAttribute("goodsForm")
            @Validated Spareparts spareparts,
            BindingResult bindingResult,
            Model model,
            final RedirectAttributes redirectAttributes) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        if (bindingResult.hasErrors()) {
            return "spareparts/sparepartEdit";
        } else {

            redirectAttributes.addFlashAttribute("css", "success");
            if (spareparts.isNew()) {
                redirectAttributes.addFlashAttribute("msg", "Товар успішно записаний в базу даних.");
            } else {
                redirectAttributes.addFlashAttribute("msg", "Товар успішно оновлено в базі даних.");
            }
            spareparts.setPriceOutHryvnya(getPriceInHryvnya(spareparts.getPriceOut()) / spareparts.getStartQuantity());
            sparepartService.saveOrUpdate(spareparts);
            return "redirect:/goods/" + spareparts.getId() + "?productType=Parts";
        }
    }

    // show add Product Form
    @RequestMapping(value = "/product/add", method = RequestMethod.GET)
    public String showAddGoodsForm(@RequestParam(value = "productType", required = false) String productType,
                                   Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());


        switch (productType) {

            case "CellPhones":

                Cellphone cellphone = new Cellphone();

                model.addAttribute("goodsForm", cellphone);
                return "phones/phoneEdit";

            case "Accessories":

                Accessories accessories = new Accessories();

                model.addAttribute("goodsForm", accessories);
                return "accessories/accessoryEdit";

            case "Parts":

                Spareparts spareparts = new Spareparts();

                model.addAttribute("goodsForm", spareparts);
                return "spareparts/sparepartEdit";
        }
        return "goods/goodsList";
    }


    // delete goods
    @RequestMapping(value = "/delete-goods-{id}", method = RequestMethod.GET)
    public String deleteProduct(@RequestParam(value = "productType", required = false) String productType,
                                @PathVariable("id") int id, final RedirectAttributes redirectAttributes) {


        switch (productType) {
            case "CellPhones":
                phoneService.delete(id);
                break;
            case "Accessories":
                accessoriesService.delete(id);
                break;
            case "Parts":
                sparepartService.delete(id);
                break;
        }

        redirectAttributes.addFlashAttribute("css", "success");
        redirectAttributes.addFlashAttribute("msg", "Товар видалено з бази даних.");

        return "redirect:/main";
    }

    // sellProduct
    @RequestMapping(value = "/cell-product-{id}", method = RequestMethod.GET)
    public String sellProductForm(@RequestParam(value = "productType", required = false) String productType,
                                  @PathVariable("id") int id,
                                  Model model,
                                  final RedirectAttributes redirectAttributes) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        switch (productType) {

            case "payDeptPhone":

                Cellphone cellphoneDept = phoneService.findById(id);
                model.addAttribute("phone", cellphoneDept);
                return "phones/phoneDeptPayment";

            case "closeDeptPhone":

                Cellphone cellphoneForClosingDept = phoneService.findById(id);
                cellphoneForClosingDept.setInDebt(false);
                model.addAttribute("phone", cellphoneForClosingDept);
                phoneService.saveOrUpdate(cellphoneForClosingDept);
                return "redirect:/goods/" + cellphoneForClosingDept.getId() + "?productType=CellPhones";

            case "CellPhones":

                Cellphone cellphone = phoneService.findById(id);
                model.addAttribute("phone", cellphone);

                return "phones/phoneSell";

            case "Accessories":

                Accessories accessories = accessoriesService.findById(id);

                accessories.setPartiallySold(true);

                if (accessories.getQuantity() == 1) {
                    accessories.setSold(true);
                }

                accessories.setQuantity(accessories.getQuantity() - 1);
                accessories.setSoldQuantity(accessories.getStartQuantity() - accessories.getQuantity());

                accessoriesService.saveOrUpdate(accessories);

                model.addAttribute("goods", accessories);

                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Товар успішно продано.");

                return "redirect:/goods/" + accessories.getId() + "?productType=Accessories";


            case "Parts":

                Spareparts spareparts = sparepartService.findById(id);

                spareparts.setPartiallySold(true);

                if (spareparts.getQuantity() == 1) {
                    spareparts.setSold(true);
                }
                spareparts.setQuantity(spareparts.getQuantity() - 1);
                spareparts.setSoldQuantity(spareparts.getStartQuantity() - spareparts.getQuantity());

                sparepartService.saveOrUpdate(spareparts);

                model.addAttribute("goods", spareparts);

                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Товар успішно продано.");

                return "redirect:/goods/" + spareparts.getId() + "?productType=Parts";
        }

        return "goods/mainPage";
    }

    // save celling cellphone Form
    @RequestMapping(value = "/cell-product-done", method = RequestMethod.POST)
    public String sellProductSavingInfo(
            @ModelAttribute("phone")
            @Validated Cellphone cellphone,
            BindingResult bindingResult,
            Model model,
            final RedirectAttributes redirectAttributes) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        if (bindingResult.hasErrors()) {
            return "phones/phoneSell";
        } else {

            redirectAttributes.addFlashAttribute("css", "success");
            redirectAttributes.addFlashAttribute("msg", "Товар успішно продано.");

            Integer priceOut = cellphone.getPriceOut();
            if (cellphone.getDiscount() != null && !cellphone.getDiscount().equals(0)) {
                priceOut = cellphone.getPriceOut() - ((cellphone.getPriceOut() * cellphone.getDiscount()) / 100);
            }

            cellphone.setSaleDate(new Date());
            cellphone.setSold(true);
            cellphone.setPriceOut(priceOut);
            cellphone.setPriceOutHryvnya(getPriceInHryvnya(priceOut));

            if (cellphone.getPriceOutFirstPart() != null && cellphone.getDebtDetails() != null) {
                cellphone.setInDebt(true);
                cellphone.setPriceOutRemainder(cellphone.getPriceOutHryvnya() - cellphone.getPriceOutFirstPart());
            }
            phoneService.saveOrUpdate(cellphone);

            model.addAttribute("id", cellphone.getId());
            return "redirect:/goods/" + cellphone.getId() + "?productType=CellPhones";
        }
    }

    //returnProduct
    @RequestMapping(value = "/return-product-{id}", method = RequestMethod.GET)
    public String returnProduct(@PathVariable("id") int id, final RedirectAttributes redirectAttributes,
                                @RequestParam(value = "productType", required = false) String productType,
                                Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        switch (productType) {

            case "CellPhones":

                Cellphone cellphone = phoneService.findById(id);

                cellphone.setInDebt(false);
                cellphone.setSold(false);
                cellphone.setSaleDate(null);
                cellphone.setSellerName(null);
                cellphone.setSellerNumber(null);
                cellphone.setDiscount(null);
                cellphone.setWarrantyTime(null);
                cellphone.setPriceOutRemainder(null);
                cellphone.setDebtDetails(null);
                cellphone.setPriceOutFirstPart(null);

                phoneService.saveOrUpdate(cellphone);

                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Товар позначений як повернений.");

                return "redirect:/goods/" + cellphone.getId() + "?productType=CellPhones";

            case "Accessories":

                Accessories accessories = accessoriesService.findById(id);
                int accQuantity = accessories.getQuantity();

                accessories.setQuantity(accQuantity + 1);

                accessories.setSoldQuantity(accessories.getStartQuantity() - accessories.getQuantity());

                if (accessories.getSoldQuantity() == 0) {
                    accessories.setSold(false);
                    accessories.setPartiallySold(false);
                } else {
                    accessories.setPartiallySold(true);
                }

                accessoriesService.saveOrUpdate(accessories);

                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Товар позначений як повернений.");

                return "redirect:/goods/" + accessories.getId() + "?productType=Accessories";

            case "Parts":

                Spareparts spareparts = sparepartService.findById(id);
                int partsQuantity = spareparts.getQuantity();

                spareparts.setQuantity(partsQuantity + 1);

                spareparts.setSoldQuantity(spareparts.getStartQuantity() - spareparts.getQuantity());

                if (spareparts.getSoldQuantity() == 0) {
                    spareparts.setSold(false);
                    spareparts.setPartiallySold(false);
                } else {
                    spareparts.setPartiallySold(true);
                }

                sparepartService.saveOrUpdate(spareparts);

                redirectAttributes.addFlashAttribute("css", "success");
                redirectAttributes.addFlashAttribute("msg", "Товар позначений як повернений.");

                return "redirect:/goods/" + spareparts.getId() + "?productType=Parts";
        }
        return "goods/mainPage";
    }


    // save dept payment cellphone Form
    @RequestMapping(value = "/payment-product-done", method = RequestMethod.POST)
    public String payDeptSaving(
            @ModelAttribute("phone")
            @Validated Cellphone cellphone,
            BindingResult bindingResult,
            Model model,
            final RedirectAttributes redirectAttributes) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult);
            return "phones/phoneDeptPayment";
        } else {

            redirectAttributes.addFlashAttribute("css", "success");
            redirectAttributes.addFlashAttribute("msg", "Дані внесеної суми записано");

            if (cellphone.getPriceOutFirstPart() != null && cellphone.getPriceOutRemainder() != null) {
                cellphone.setPriceOutRemainder(cellphone.getPriceOutRemainder() - cellphone.getPriceOutFirstPart());
            } else {
                model.addAttribute("css", "danger");
                model.addAttribute("msg", "У товару відсутня сума останнього внеску або залишкова сума");
                return "phones/phoneDeptPayment";
            }

            phoneService.saveOrUpdate(cellphone);

            model.addAttribute("id", cellphone.getId());
            return "redirect:/goods/" + cellphone.getId() + "?productType=CellPhones";
        }
    }


    // show reports page
    @RequestMapping(value = "/reports", method = RequestMethod.GET)
    public String showReports(Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());

        model.addAttribute("reportObjectList", reportService.getActiveSumAndQuantity());

        return "goods/report";
    }


    // show product
    @RequestMapping(value = "/print-{id}", method = RequestMethod.GET)
    public String printProductLabel(@RequestParam(value = "productType", required = false) String productType,
                                    @PathVariable("id") int id,
                                    Model model) {

        model.addAttribute("clientIp", webService.getClientIp());
        model.addAttribute("loggedinuser", getPrincipal());
        model.addAttribute("usdRate", getCurrentUsdRate());

        switch (productType) {

            case "CellPhones":

                Cellphone cellphone = phoneService.findById(id);
                if (cellphone == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goods", cellphone);
                return "phones/phoneShowLabel";

            case "Accessories":

                Accessories accessories = accessoriesService.findById(id);
                if (accessories == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goods", accessories);
                return "accessories/accessoryShowLabel";

            case "Parts":

                Spareparts spareparts = sparepartService.findById(id);
                if (spareparts == null) {
                    model.addAttribute("css", "danger");
                    model.addAttribute("msg", "Товар не знайдено в базі даних.");
                }
                model.addAttribute("goods", spareparts);
                return "spareparts/sparepartShowLabel";

        }
        return "goods/goodsList";
    }


    // Product not found handler message
    @ExceptionHandler(EmptyResultDataAccessException.class)
    public ModelAndView handleEmptyData(HttpServletRequest req, Exception ex) {

        ModelAndView model = new ModelAndView();
        model.addObject("msg", "Товар не знайдено в базі даних.");
        model.setViewName("goods/mainPage");
        return model;
    }

    private Integer getPriceInHryvnya(Integer priceOut) {
        float currestUsdRate = Float.valueOf(getCurrentUsdRate());
        float productOutPrice = priceOut;
        float price = productOutPrice * currestUsdRate;
        Integer roundedPrice = Math.round(price / 10) * 10;
        return roundedPrice;
    }

    String getCurrentUsdRate() {

        String rateUsd = "0";
        try {
            String rateString = readUrl("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5");
            rateUsd = rateString.split("\"ccy\":\"USD\",\"base_ccy\":\"UAH\",\"buy\":")[1].split("\"")[5];
            rateUsd = rateUsd.substring(0, 5);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rateUsd;
    }

/*    String getCurrentUsdRate() {
        String currentDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String usdRateUrl = String.format("http://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?valcode=USD&date=%s&json", currentDate);

        String usdCurrentRate = "1";
        try {
            String rateString = readUrl(usdRateUrl);
            usdCurrentRate = rateString.split("\"rate\":")[1].split(",")[0];
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usdCurrentRate;
    }*/

    private String readUrl(String usdRateUrl) throws IOException {

        final URL website = new URL(usdRateUrl);
        final StringBuilder[] response = new StringBuilder[1];
        response[0] = new StringBuilder();
        response[0].append("1");

        Thread loadRatesThread = new Thread() {
            public void run() {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(website.openStream()))) {
                    String inputLine;
                    while ((inputLine = in.readLine()) != null)
                        response[0].append(inputLine);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };
        loadRatesThread.start();
        try {
            loadRatesThread.join(2500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return response[0].toString();
    }
}