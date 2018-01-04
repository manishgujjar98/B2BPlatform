package com.trend.resources;

import java.util.Date;
import java.util.List;
import java.util.UUID;

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

import com.trend.cassandra.models.PostCommentsDTO;
import com.trend.daoimpl.PostCommentsDAOImpl;
import com.trend.utils.Constants;
import com.trend.utils.ResponseUtil;

@Path("/posts/{postID}")
@Produces(MediaType.APPLICATION_JSON)
public class PostCommentsResource {
	
	private static final Logger LOGGER = Logger.getLogger(PostCommentsResource.class);

	@POST
	public PostCommentsDTO addComment(@PathParam("postID") String postID, PostCommentsDTO postCommentsDTO) {
		if (postCommentsDTO == null) {
			LOGGER.debug("postCommentsDTO is blank");
			throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, "Invalid Request", Status.BAD_REQUEST));
		}
		postCommentsDTO.setComment_id(UUID.randomUUID().toString());
		postCommentsDTO.setComment_date(new Date());
		postCommentsDTO.setPost_id(postID);
		if (new PostCommentsDAOImpl().save(postCommentsDTO)) {
			return postCommentsDTO;
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<PostCommentsDTO> getPostComments(@PathParam("postID") String postID) {
		return new PostCommentsDAOImpl().getALL(postID);
	}

	@GET
	@Path("comments/{commentID}")
	@Produces(MediaType.APPLICATION_JSON)
	public PostCommentsDTO getComment(@PathParam("postID") String postID, @PathParam("commentID") String commentID) {
		return new PostCommentsDAOImpl().get(postID, commentID);
	}
	
	@DELETE
	@Path("comments/{commentID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteComment(@PathParam("postID") String postID, @PathParam("commentID") String commentID) {
		if(new PostCommentsDAOImpl().delete(postID, commentID)){
			return Response.ok().build();
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

	@PUT
	@Path("comments/{commentID}")
	public Response addComment(@PathParam("postID") String postID, @PathParam("commentID") String commentID, PostCommentsDTO postCommentsDTO) {
		if (postCommentsDTO == null) {

		}
		postCommentsDTO.setPost_id(postID);
		postCommentsDTO.setComment_id(commentID);
		if (new PostCommentsDAOImpl().save(postCommentsDTO)) {
			return Response.ok().build();
		}
		throw new WebApplicationException(ResponseUtil.constructResponse(Constants.FAILURE_STATUS, Constants.UNEXPECTED_ERROR_STATUS, Status.INTERNAL_SERVER_ERROR));
	}

}
