const Axios = require("axios");
const queryString = require("query-string");

exports.authenticate = async (req, res) => {
  try {
    const { code } = req.query;
    console.log(code);
    const s = await fetchToken(code);
    const p = await fetchProfile(s.access_token);
    res.json({p});
  } catch (error) {
    res.status(400).json({
      success: false,
      error: error
    });
  }
};

const fetchToken = async code => {
  try {
    const { data } = await Axios.get(
      `https://stage.vivaconagua.org/drops/oauth2/access_token?grant_type=authorization_code&client_id=wavesex&code=${code}&redirect_uri=http://localhost/waves/api/v1/oauth`
    );
    return data;
  } catch (error) {
    throw error;
  }
};

const fetchProfile = async access_token => {
  try {
    console.log(access_token);
    const  {data}  = await Axios.get(
      "https://stage.vivaconagua.org/drops/oauth2/rest/profile?access_token=" + access_token
    );
    console.log(data);
    return data;
  } catch (error) {
    throw error;
  }
};

exports.receiveToken = (req, res) => {
  res.json({});
};
