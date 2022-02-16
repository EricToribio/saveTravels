package com.safetravel.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import com.safetravel.mvc.models.Expense;
import com.safetravel.mvc.services.ExpenseService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller

public class ExpenseController {
	private final ExpenseService expenseService;

	public ExpenseController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}
	@GetMapping("/expense/{id}")
	public String oneExpense(@PathVariable("id") Long id, Model model){
		Expense oneExpense = expenseService.findExpense(id);
		model.addAttribute(oneExpense);
		return "oneExpense.jsp";

	}

	@GetMapping("/expense")
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
	@GetMapping("/expense/edit/{id}")
	public String editExpense(@PathVariable("id") Long id, Model model){
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "editExpense.jsp";
	}
	@PutMapping("/expense/update/{id}")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result ,@PathVariable("id") Long id){
		if (result.hasErrors()) {

			return "editExpense.jsp";
		}
		expenseService.updateExpense(expense, id);
		return "redirect:/expense";
	}
	
	@DeleteMapping("/expense/delete/{id}")
    public String destroy(@PathVariable("id") Long id) {
        expenseService.delete(id);
        return "redirect:/expense";
    }

}
