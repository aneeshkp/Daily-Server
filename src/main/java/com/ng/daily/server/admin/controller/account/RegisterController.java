
package com.ng.daily.server.admin.controller.account;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.entity.User;
import com.ng.daily.server.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * 用户注册的Controller.
 *
 * @author calvin
 */
@Controller
@RequestMapping(value = "/admin/register")
public class RegisterController extends BaseAdminController {

    @Autowired
    private AccountService accountService;

    @RequestMapping(method = RequestMethod.GET)
    public String registerForm() {
        return "admin/account/register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(@Valid User user, RedirectAttributes redirectAttributes) {
        accountService.registerUser(user);
        redirectAttributes.addFlashAttribute("username", user.getLoginName());
        return "redirect:/admin/login";
    }

    /**
     * Ajax请求校验loginName是否唯一。
     */
    @RequestMapping(value = "checkLoginName")
    @ResponseBody
    public String checkLoginName(@RequestParam("loginName") String loginName) {
        if (accountService.findUserByLoginName(loginName) == null) {
            return "{valid:true}";
        } else {
            return "{valid:false}";
        }
    }

}
