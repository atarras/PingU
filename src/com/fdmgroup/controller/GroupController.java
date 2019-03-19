package com.fdmgroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fdmgroup.DAO.GroupDAO;
import com.fdmgroup.DAO.UserDAO;
import com.fdmgroup.model.Group;
import com.fdmgroup.model.IUser;

//TODO: Add RequestMappings linked to the front end.
//TODO: Change how the functions work based on the front end.

/**
 * 
 *	GroupController handles any logic revolving the Group model.
 *	Includes creating a group, adding users to a group, and showing all users in a group.
 *
 */
@Controller
public class GroupController {
	/**
	 * Data Access Object to interact with the Group table.
	 */
	@Autowired
	private GroupDAO groupDao ;
	/**
	 * Data Access Object to interact with the User table.
	 */
	@Autowired
	private UserDAO userDao;
	
	/**
	 * 
	 * User calls method to persist group.
	 * 
	 * @param g: The group user wants to persist.
	 */
	public void createGroup(Group g){
		groupDao.create(g);
	}
	
	/**
	 * 
	 * Adds the user to the list of group members in specified group.
	 * 
	 * @param currGroup: Group user wants to be added to
	 * @param user: The user to be added
	 */
	
	public void addUser(Group currGroup, IUser user){
		userDao.updateGroup(user.getUserId(), currGroup);
		currGroup.addUserToGroup(user);
		groupDao.updateGroupMembers(currGroup);		
	}
	
	
	/**
	 * 
	 * Retrieve the list of members for the specified group.
	 * 
	 * @param g: The group user wants to retrieve the list of members for.
	 * @return List of users currently in the group.
	 */
	public List<IUser> showAllUsers(Group g){
		return g.getGroupMembers();
	}

	
}
