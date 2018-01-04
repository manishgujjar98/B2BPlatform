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

import com.trend.cassandra.models.UserFollowersDTO;
import com.trend.daoimpl.UserFollowersDAOImpl;
import com.trend.utils.Constants;
import com.trend.utils.ResponseUtil;

@Path("/users/{userID}/followers")
public class UserFollowersResource {

	private static final Logger LOGGER = Logger.getLogger(UserFollowersResource.class);

	@POST
	public UserFollowersDTO addFollower(@PathParam("userID") String userID, UserFollowersDTO follower) {
		if (follower == null) {
			LOGGER.debug("follower is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Request", Status.BAD_REQUEST));
		}
		follower.setFollowed_date(new Date());
		if (new UserFollowersDAOImpl().save(follower)) {
			return follower;
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<UserFollowersDTO> getFollowers(@PathParam("userID") String userID) {
		return new UserFollowersDAOImpl().getALL(userID);
	}

	@GET
	@Path("followers/{followerID}")
	@Produces(MediaType.APPLICATION_JSON)
	public UserFollowersDTO getComment(@PathParam("userID") String userID, @PathParam("followerID") String followerID) {
		return new UserFollowersDAOImpl().get(userID, followerID);
	}

	@DELETE
	@Path("followers/{followerID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteComment(@PathParam("userID") String userID, @PathParam("followerID") String followerID) {
		if (new UserFollowersDAOImpl().delete(userID, followerID)) {
			return Response.ok().build();
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

	@PUT
	@Path("followers/{followerID}")
	public UserFollowersDTO addComment(@PathParam("userID") String userID, @PathParam("followerID") String followerID, UserFollowersDTO follower) {
		if (follower == null) {
			LOGGER.debug("follower is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Request", Status.BAD_REQUEST));
		}
		follower.setFollowed_date(new Date());
		if (new UserFollowersDAOImpl().save(follower)) {
			return follower;
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

}
