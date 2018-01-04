package com.trend.resources;

import java.util.Date;
import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.apache.log4j.Logger;

import com.trend.cassandra.models.UserFolloweesDTO;
import com.trend.daoimpl.UserFolloweeDAOImpl;
import com.trend.utils.Constants;
import com.trend.utils.ResponseUtil;

@Path("/users/{userID}/followees")
public class UserFolloweesResource {

	private static final Logger LOGGER = Logger.getLogger(UserFolloweesResource.class);

	@POST
	public UserFolloweesDTO addFollowee(@PathParam("userID") String userID, UserFolloweesDTO followee) {
		if (followee == null) {
			LOGGER.debug("followee is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Request", Status.BAD_REQUEST));
		}
		followee.setFollowed_date(new Date());
		if (new UserFolloweeDAOImpl().save(followee)) {
			return followee;
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserFolloweesDTO> getFollowees(@PathParam("userID") String userID) {
		return new UserFolloweeDAOImpl().getALL(userID);
	}

	@GET
	@Path("followees/{followeeID}")
	@Produces(MediaType.APPLICATION_JSON)
	public UserFolloweesDTO getFollowee(@PathParam("userID") String userID, @PathParam("followeeID") String followeeID) {
		return new UserFolloweeDAOImpl().get(userID, followeeID);
	}

	@DELETE
	@Path("followees/{followeeID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteFollowee(@PathParam("userID") String userID, @PathParam("followeeID") String followeeID) {
		if (new UserFolloweeDAOImpl().delete(userID, followeeID)) {
			return Response.ok().build();
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

	@PUT
	@Path("followees/{followeeID}")
	public UserFolloweesDTO addFollowee(@PathParam("userID") String userID, @PathParam("followeeID") String followeeID, UserFolloweesDTO Followee) {
		if (Followee == null) {
			LOGGER.debug("Followee is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Request", Status.BAD_REQUEST));
		}
		Followee.setFollowed_date(new Date());
		if (new UserFolloweeDAOImpl().save(Followee)) {
			return Followee;
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

}
