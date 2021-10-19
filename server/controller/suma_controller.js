const { request, response } = require("express");

module.exports = {
	suma: (req = request, res = response) => {
		const { primerNumero, segundoNumero } = req.body;
		if (!isNaN(primerNumero) && !isNaN(segundoNumero)) {
			return res.status(200).json({ suma: primerNumero + segundoNumero });
		} else {
			return res
				.status(400)
				.json({ error: "No se recibieron los dos números" });
		}
	},
};
