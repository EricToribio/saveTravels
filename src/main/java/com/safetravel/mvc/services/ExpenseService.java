package com.safetravel.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.safetravel.mvc.models.Expense;
import com.safetravel.mvc.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	private final ExpenseRepository repo;
	
	public ExpenseService(ExpenseRepository repo) {
		this .repo = repo;
}

public List<Expense> allExpenses() {
    return repo.findAll();
}

public Expense createExpense(Expense b) {
    return repo.save(b);
}

public Expense findExpense(Long id) {
    Optional<Expense> optionalExpense = repo.findById(id);
    if(optionalExpense.isPresent()) {
        return optionalExpense.get();
    } else {
        return null;
    }
}
//public Book updateBook(
//		Long id, 
//		String title, 
//		String description, 
//		String language, 
//		Integer numberOfPages) {
//	Optional<Book> optionalBook = bookRepository.findById(id);
//	if(optionalBook.isPresent()) {
//		Book book = optionalBook.get();
//		book.setTitle(title);
//		book.setDescription(description);
//		book.setLanguage(language);
//		book.setNumberOfPages(numberOfPages);
//		return bookRepository.save(book);
//	} else {
//		return null;
//	}	
//}
public String delete(Long id) {
	Optional<Expense> optionalExpense = repo.findById(id);
	if(optionalExpense.isPresent()) {
		repo.deleteById(id);
		return "Deleted";
	} else {
		return "No book to delete";
	}
}
}
