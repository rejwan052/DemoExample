package info.diit.persistence.service;

import info.diit.persistence.model.Country;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class CountryService implements ICountryService {
	
	private JdbcTemplate jdbcTemplate;
	
	public CountryService(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Country> countryList() {
		
		String sql = "SELECT countryId,countryName FROM country";
		
		List<Country> countryList = jdbcTemplate.query(sql,new RowMapper<Country>() {

			public Country mapRow(ResultSet rs, int rowNum) throws SQLException,NullPointerException {
				
				Country country = new Country();
	
				country.setCountryId(rs.getInt("countryId"));
				country.setCountryName(rs.getString("countryName"));
				
				return country;
			}
			
		});
		
		return countryList;
		
	}


}
