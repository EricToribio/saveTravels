package com.safetravel.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.safetravel.mvc.models.Expense;
import com.safetravel.mvc.services.ExpenseService;

@Controller

public class ExpenseController {
	private final ExpenseService expenseService;

	public ExpenseController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}

	@RequestMapping("/expense")
	public String Index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "expenseForm.jsp";
	}

	@PostMapping("/expense/data")
	public String formData(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {

			return "expenseForm.jsp";
		}
		expenseService.createExpense(expense);
		return "redirect:/expense";
	}

}
